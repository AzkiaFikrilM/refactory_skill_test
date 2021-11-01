// Write a JavaScript function that checks whether a passed string is palindrome or not? 

function _isPalindrome(str){
	// Change the string into lower case and remove  all non-alphanumeric characters
	   var data = str.toLowerCase().replace(/[^a-zA-Z0-9]+/g,'');
		var ccount = 0;
	// Check whether the string is empty or not
		if(data==="") {
			console.log("Nothing found!");
			return false;
		}
	// Check if the length of the string is even or odd 
		if ((data.length) % 2 === 0) {
			ccount = (data.length) / 2;
		} else {
	// If the length of the string is 1 then it becomes a palindrome
			if (data.length === 1) {
				console.log("Entry is a palindrome.");
				return true;
			} else {
	// If the length of the string is odd ignore middle character
				ccount = (data.length - 1) / 2;
			}
		}
	// Loop through to check the first character to the last character and then move next
		for (var x = 0; x < ccount; x++) {
	// Compare characters and drop them if they do not match 
			if (data[x] != data.slice(-1-x)[0]) {
				console.log(data + " # --> not palindrome");
				return false;
			}
		}
		console.log(data + " # --> palindrome");
		return true;
	}
	_isPalindrome('Radar');
	_isPalindrome('Malam');
	_isPalindrome('Kasur ini rusak');
	_isPalindrome('Ibu Ratna antar ubi');
	_isPalindrome('Malas');
	_isPalindrome('Makan nasi goreng');
	_isPalindrome('Balonku ada lima');