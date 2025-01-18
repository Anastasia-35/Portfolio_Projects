import pandas as pd

# Load the cleaned dataset
movies_df = pd.read_csv('data/cleaned1_movies.csv')

def recommend_by_genre(genre):
    # Filter movies and series by the genre from 'listed_in' column
    movies = movies_df[movies_df['listed_in'].str.contains(genre, case=False, na=False) & (movies_df['type'] == 'Movie')]['title'].head(5).tolist()
    series = movies_df[movies_df['listed_in'].str.contains(genre, case=False, na=False) & (movies_df['type'] == 'TV Show')]['title'].head(5).tolist()

    return {"movies": movies, "series": series}
