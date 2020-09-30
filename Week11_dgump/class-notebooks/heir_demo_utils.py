import re
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


def dist_mat_to_tall(square_dist_mat, sort=False):
    """Convert a square distance matrix to tall"""
    # Convert to tall and rename
    dist_df = pd.melt(square_dist_mat.reset_index(), id_vars="index")
    dist_df.columns = ["sample_1", "sample_2", "dist"]

    # De-duplicate info
    dist_df = dist_df[dist_df["sample_1"] < dist_df["sample_2"]]

    if sort:
        dist_df = dist_df.sort_values("dist")

    dist_df = dist_df.reset_index(drop=True)

    return dist_df


def label_scatter(x, y, text, data=None):
    """Put text on a plot at given locations
    
    Made to have a similar syntax to seaborn (w/o full options)
    """
    if isinstance(x, str):
        x = data[x]

    if isinstance(y, str):
        y = data[y]

    if isinstance(text, str):
        text = data[text]

    x_mean = np.mean(x)
    y_mean = np.mean(y)

    x_buffer = abs(x_mean) * 0.05
    y_buffer = abs(y_mean) * 0.015

    for xi, yi, text_i in zip(x, y, text):
        plt.text(xi - x_buffer, yi + y_buffer, text_i)
        
        
def merge_closest_pair(square_dist_mat, linkage="mean"):
    """Perform an agglomerative heirarchical cluster merge to a distance matrix"""
    # Find closest pair
    tall_dist_df = dist_mat_to_tall(square_dist_mat)
    two_closest = tall_dist_df.sort_values("dist").head(1)

    # Sort alphabetically and create a name for merged pair
    merge = sorted(
        [two_closest.iloc[0, 0], two_closest.iloc[0, 1]],
        key=lambda x: re.sub(r"[\(\),]", "z", x),
    )
    merged_name = f"({merge[0]}, {merge[1]})"

    # Make a collapsed version of distance matrix
    merged_dist_mat = square_dist_mat.drop(index=[merge[1]], columns=[merge[1]])
    merged_dist_mat = merged_dist_mat.rename(
        index={merge[0]: merged_name}, columns={merge[0]: merged_name}
    )

    # Set merged to NaNs as a placeholder and set diag to 0
    merged_dist_mat.loc[:, merged_name] = np.nan
    merged_dist_mat.loc[merged_name, :] = np.nan
    merged_dist_mat.loc[merged_name, merged_name] = 0

    # Filter to rows that concern the merging pair
    # Remove row for the pair
    merge_tall_dist_df = tall_dist_df[
        tall_dist_df["sample_1"].isin(merge) | tall_dist_df["sample_2"].isin(merge)
    ]
    merge_tall_dist_df = merge_tall_dist_df[
        ~(
            merge_tall_dist_df["sample_1"].isin(merge)
            & merge_tall_dist_df["sample_2"].isin(merge)
        )
    ]

    # Swap values so sample_2 is always the member from the merged pair
    swap_rows = merge_tall_dist_df["sample_1"].isin(merge)
    copy = merge_tall_dist_df.copy()
    merge_tall_dist_df.loc[swap_rows, "sample_1"] = copy.loc[swap_rows, "sample_2"]
    merge_tall_dist_df.loc[swap_rows, "sample_2"] = copy.loc[swap_rows, "sample_1"]

    # Apply linkage function
    merged_dists = merge_tall_dist_df.groupby("sample_1").agg({"dist": linkage})

    # Update values in merged distance matrix
    for name, row in merged_dists.iterrows():
        merged_dist_mat.loc[name, merged_name] = row["dist"]
        merged_dist_mat.loc[merged_name, name] = row["dist"]

    return merged_dist_mat
