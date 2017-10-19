var App = {
	currentNumScreen: document.querySelector('#screen .current_num'),
	operationsScreen: document.querySelector('#screen .calculation'),
	resultStatus: false,
	result: 0,
	currentOp: '+',

	handleDigitClick: function(e) {
		e.preventDefault();

		this.printDigit(e.target.textContent.trim());
	},

	handleOpClick: function(e) {
		e.preventDefault();

		this.printOperator(e.target.textContent.trim());
	},

	clearAll: function(e) {
		this.clear(e);
		this.clearOpScreen();
		this.reset();
	},

	clear: function(e) {
		e.preventDefault();
		this.clearCurrNumScreen();
		this.currentNumScreen.textContent = '0'
	},

	handleResClick: function(e) {
		e.preventDefault();

		this.calculateResult();
		this.clearOpScreen();
		this.reset();
	},

	handleDotClick: function(e) {
		e.preventDefault();

		if(this.currentNumScreen.textContent.indexOf('.') === -1) {
			this.printToNumScreen('.');
		}
	}

	reset: function() {
		this.result = 0;
		this.currentOp = '+';
	},

	printOperator: function(op) {
		var prevOperationText = this.operationsScreen.textContent;
		var numAndOpToAdd = this.currentNumScreen.textContent + ' ' + op + ' ';
		this.calculateResult();
		this.currentOp = op;
		this.operationsScreen.textContent = prevOperationText + numAndOpToAdd;
	},

	clearCurrNumScreen: function() {
		this.currentNumScreen.textContent = '';
	},

	clearOpScreen: function() {
		this.operationsScreen.textContent = '';
	},

	calculateResult: function() {
		var currentNumScreen = this.currentNumScreen.textContent;
		var number;
		if (currentNumScreen.includes('.')) {
			number = parseFloat(currentNumScreen);
		} else {
			number = parseInt(currentNumScreen);
		}

		switch (this.currentOp) {
			case '+':
				this.result += number;
				break;
			case '-':
				this.result -= number;
				break;
			case '/':
				this.result /= number;
				break;
			case 'x':
				this.result *= number;
				break;
			case '%':
				this.result = this.result % number;
				break;
		}

		this.displayResult();
	},

	negateNum: function() {
		if (this.currentNumScreen.textContent !== '0') {
			this.currentNumScreen.textContent = '-' + this.currentNumScreen.textContent;
		}
	}

	displayResult: function() {
		this.currentNumScreen.textContent = this.result;
		this.resultStatus = true;
	},

	printDigit: function(digit) {
		if(this.currentNumScreen.textContent === '0') this.clearCurrNumScreen();
		if (this.resultStatus) {
			this.clearCurrNumScreen();
			this.resultStatus = false;
		}

		this.printToNumScreen(digit);
	},

	printToNumScreen: function(item) {
		var currText = this.currentNumScreen.textContent.trim();
		this.currentNumScreen.textContent = currText + item;
	},

	bind: function() {
		document.querySelectorAll('.digit').forEach(function(digitButton) {
			digitButton.addEventListener('click', this.handleDigitClick.bind(this));
		}.bind(this));

		document.querySelectorAll('.op').forEach(function(opButton) {
			opButton.addEventListener('click', this.handleOpClick.bind(this));
		}.bind(this));

		document.querySelector('.result_button').addEventListener('click', this.handleResClick.bind(this));
		document.querySelector('#neg').addEventListener('click', this.negateNum.bind(this));
		document.querySelector('#c').addEventListener('click', this.clear.bind(this));
		document.querySelector('#ce').addEventListener('click', this.clearAll.bind(this));
		document.querySelector('.dot').addEventListener('click', this.handleDotClick.bind(this));
	},

	init: function() {
		this.bind();
	}
}

App.init();