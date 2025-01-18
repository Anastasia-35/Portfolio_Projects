

document.getElementById('genreForm').onsubmit = async (e) => {
    e.preventDefault();
    const genre = document.getElementById('genre').value;
    const response = await fetch('/recommend_by_genre', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `genre=${genre}`
    });

    // Ensure the response is valid JSON before parsing it
    if (!response.ok) {
        const errorMessage = await response.text();  // Get the error message if not OK
        console.error("Error: ", errorMessage);
        return;
    }

    const data = await response.json();  // Parse the JSON response
    const resultsDiv = document.getElementById('results');
    resultsDiv.innerHTML = `
        <h2>Recommendations</h2>
        <h3>Movies</h3>
        <ul>${data.movies.map(m => `<li>${m}</li>`).join('')}</ul>
        <h3>Series</h3>
        <ul>${data.series.map(s => `<li>${s}</li>`).join('')}</ul>
    `;
};
