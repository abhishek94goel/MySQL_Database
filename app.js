var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection(
					{
						host : 'localhost',
						user : 'root',
						database: 'join_us'
					}
				);

function generateAddress(){
	console.log(faker.address.streetAddress());
	console.log(faker.address.state());
}

generateAddress();

var q = "SELECT 1+1 AS sum";
connection.query(q, function(error,results,fiels){
				if(error) throw error;
				console.log(results[0].sum);
				});


var q = "SELECT CURDATE() AS DATE, CURTIME() AS TIME, CURRENT_TIMESTAMP() AS NOW";
connection.query(q, function(error,results,fields){
				if(error) throw error;
				console.log(results[0].DATE,results[0].TIME,results[0].NOW);
				}
				);

var q = "SELECT * FROM users";
connection.query(q, function(error, results, fields){
				if(error) throw error;
				console.log(results[1]);
				});

// 				Inserting into the Database through NodeJS

	// Method 1 to insert
q = "INSERT INTO users (email) VALUES ('rajandsg1670@gmail.com')"; // We need to change the email address here at every execution of the file !
connection.query(q, function(error, results, fields){
				if(error) throw error;
				console.log(results);
				});

q = "INSERT INTO users(email, created_at) VALUES ('" + faker.internet.email() + "','" + faker.date.past() + "')";
connection.query(q, function(error,result){
										if(error) throw error;
										console.log(result);
										});

	// Method 2 to insert
var person = {email : faker.internet.email(),
			 created_at : faker.date.past()};
connection.query('INSERT INTO users SET ?', person, function(error, results, fields){
													if(error) throw error;
													console.log(results);
													}
				);

// Insertion of Multiple users in our Database
var data =[	[faker.internet.email() , faker.date.past()],	// ['blah@gmail.com', '2017-05-01 03:51:37'],
    		[faker.internet.email() , faker.date.past()],	// ['ugh@gmail.com', '2017-05-01 03:51:37'],
    		[faker.internet.email() , faker.date.past()]	// ['meh@gmail.com', '2017-05-01 03:51:37']
		  ];

var q = "INSERT INTO users (email, created_at) VALUES ?";
connection.query(q, [data], function(err,results){
							if(err) throw err;
							console.log(results);
							}
				);

// Bulk insertion of 500 users Data
var data =[];
for(var i=0; i<500 ;i++){
	data.push(
				[faker.internet.email() , faker.date.past()]
			);
}

var q = "INSERT INTO users (email,created_at) VALUES ?";
connection.query(q, [data], function(error,results){
							if(error) throw error;
							console.log(results);
							}
				);

// Printing all emails.
var q = "SELECT * FROM users";
connection.query(q, function(error, results, fields){
				if(error) throw error;
				for(var i=0; i < results.length; i++){
					console.log([results[i].email,results[i].created_at]);	
				}
				});

connection.end();