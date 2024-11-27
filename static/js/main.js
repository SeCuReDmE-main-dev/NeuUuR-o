// ...existing code...
document.getElementById('extract_features_button').addEventListener('click', function() {
    const data = document.getElementById('time_series_data').value;
    fetch('/extract_features', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ time_series_data: JSON.parse(data) })
    })
    .then(response => response.json())
    .then(features => {
        document.getElementById('features_result').innerText = JSON.stringify(features, null, 2);
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

document.getElementById('analyze_data_button').addEventListener('click', function() {
    const data = document.getElementById('time_series_data').value;
    fetch('/analyze_data', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ time_series_data: JSON.parse(data) })
    })
    .then(response => response.json())
    .then(analysis => {
        document.getElementById('analysis_result').innerText = JSON.stringify(analysis, null, 2);
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
// ...existing code...