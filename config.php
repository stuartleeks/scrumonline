$conn = array(
    'dbname' => $_ENV["DB_NAME"],
    'user' => $_ENV["DB_USER"],
    'password' => $_ENV["DB_PASS"],
    'host' => $_ENV["DB_HOST"],
    'driver' => 'pdo_mysql',
);

$host = $_ENV["HOST"];

$cardSets = [
    ['XS', 'S', 'M', 'L', 'XL', '?', '&#9749;'],
    // Standard fibonaci like series of values
    ['1', '2', '3', '5', '8', '13', '20', '40', '100'],
    // Special card set with '?' for unclear stories
    ['1', '2', '3', '5', '8', '13', '20', '40', '?'],
    // Powers of two used by other teams
    ['0' ,'1', '2', '4', '8', '16', '32', '64'],
    // Card set used to estimate hours as different fractions and multiples of a working day
    ['1', '2', '4', '8', '12', '16', '24', '32', '40'],
    // Demonstration of the coffee cup card
    ['&#9749;', '1', '2', '3', '5', '8', '13', '20', '?'],
    // T-shirt Size
    ['XXS','XS', 'S', 'M', 'L', 'XL', 'XXL', '?'],
    // Fibonacci number
    ['1', '2', '3', '5', '8', '13', '21', '34', '55', '89', '144', '&#9749;', '?'],
    // Fibonaci series including 0.5
    ['0.5', '1', '2', '3', '5', '8', '13', '20', '40', '100'],
    // Canadian Cash format
    ['1', '2', '5', '10', '20', '50', '100'],
    // Standard fibonacci with shrug
    ['1', '2', '3', '5', '8', '13', '&#F937;'],
    // Standard fibonaci like series of values with 0, 1/2, infinity, and shrug
    ['0', '1/2', '1', '2', '3', '5', '8', '13', '20', '40', '100', '&#8734;', '&#F937;'],
    // Decimal values representing number of dev weeks of effort
    ['0.1', '0.2', '0.5', '1', '2', '?']
];