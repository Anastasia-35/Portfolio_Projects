from flask import Flask, render_template, request, jsonify
import recommender

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/recommend_by_genre', methods=['POST'])
def recommend_by_genre():
    genre = request.form['genre']
    
    # Call the recommendation function from recommender.py
    recommendations = recommender.recommend_by_genre(genre)
    
    # Return the recommendations as a JSON response
    return jsonify(recommendations)

if __name__ == '__main__':
    app.run(debug=True)
