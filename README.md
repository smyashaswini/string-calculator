# String Calculator API

A Ruby on Rails API application that performs addition operations on string inputs with support for various delimiters and validation rules.

## Prerequisites

Before setting up the application, ensure you have the following installed:

- **Ruby**: Version 3.2.2 or later
- **Bundler**: Ruby dependency manager

### Check Prerequisites
```bash
# Check Ruby version
ruby --version

# Install Bundler if not already installed
gem install bundler
```

## Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd incubyte
```

### 2. Install Dependencies
```bash
# Install all required gems
bundle install
```

### 3. Verify Installation
```bash
# Check if all dependencies are satisfied
bundle check

# Verify Rails is working
rails --version
```

## Running the Server

### Start the Development Server
```bash
# Start the Rails server
rails server

# Or use the short form
rails s

# By default, Rails runs on port 3000
# To run on a different port (e.g., port 4000)
rails server -p 4000
```

### Verify the Server is Running
- Open your browser and navigate to `http://localhost:3000`
- The application will be available at this URL
- You can test the API endpoint at: `POST /calculator/add` using Postman or `curl`

### Stop the Server
- Press `Ctrl + C` in the terminal where the server is running

## API Usage

### Calculator Addition Endpoint

**Endpoint:** `POST /calculator/add`

**Parameters:**
- `input_string` (string): A string containing numbers separated by various delimiters

**Example Requests:**

```bash
# Empty string returns 0
curl -X POST "http://localhost:3000/calculator/add" -d "input_string=" -H "Content-Type: application/x-www-form-urlencoded"

# Mixed delimiters (newline, comma, semicolon, etc.)
curl -X POST "http://localhost:3000/calculator/add" -d "input_string=//1abc\n2def3" -H "Content-Type: application/x-www-form-urlencoded"
```

**Response Format:**

Success:
```json
{
  "result": 6
}
```

Error (negative numbers):
```json
{
  "error": "Negatives not allowed: -2, -4"
}
```
### Run All Tests
```bash
# Execute the complete test suite
rails test

# Run tests with verbose output
rails test -v
```
### Run Specific Test Files
```bash
# Run controller tests
rails test test/controllers/calculator_controller_test.rb
```
