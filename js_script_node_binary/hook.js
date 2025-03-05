#!/usr/bin/env node

const https = require('https');

// Define the API request URL
const url = 'https://www.random.org/integers/?num=1&min=0&max=100&col=1&base=10&format=plain&rnd=new';

// Perform the API request
https.get(url, (res) => {
    let data = '';

    // Collect response data
    res.on('data', (chunk) => {
        data += chunk;
    });

    // Print an export command when response ends
    res.on('end', () => {
        const randomNumber = data.trim();
        console.log(`Random number is ${randomNumber}`);
    });

}).on('error', (err) => {
    console.error('Error fetching random number:', err.message);
    process.exit(1);
});
