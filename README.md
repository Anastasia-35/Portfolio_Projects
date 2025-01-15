# Netflix Movie/TV Show Recommendation System

A content-based recommendation system built to suggest similar movies or TV shows based on a given title. The project uses **TF-IDF (Term Frequency-Inverse Document Frequency)** and **Cosine Similarity** to compare the features (e.g., title, genres, cast, director) of movies or TV shows in a dataset.

## Project Overview

This recommendation system allows users to input a movie or TV show title and receive a list of similar shows or movies based on attributes such as title, genres, cast, and director. By leveraging **TF-IDF vectorization** and **Cosine Similarity**, the system recommends content with similar features.

### Key Features

- **Content-Based Filtering**: Recommends movies or TV shows based on their features (e.g., genre, director, cast).
- **Cosine Similarity**: Measures the similarity between content based on their feature vectors.
- **TF-IDF Vectorization**: Converts textual data (like genre, director, cast) into numerical vectors for comparison.

### Example Use Case:
- **Input**: Movie/TV Show title (e.g., "grown ups").
- **Output**: List of recommended shows or movies based on the input title.

## Technologies Used

- **Python**: The main programming language.
- **Pandas**: Used for data manipulation and processing.
- **Scikit-learn**: Used for vectorizing text data and calculating cosine similarity.
- **Jupyter Notebook**: For prototyping and running the code (optional).
- **CSV File**: A dataset containing Netflix titles (movies and TV shows).

## Requirements

To run the project locally, you'll need to install the following dependencies:

- Python 3.x
- Pandas
- Scikit-learn

You can install the necessary dependencies using `pip`:

```bash
pip install pandas scikit-learn
