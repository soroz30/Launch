var App = {

  toggleBold: function(e) {
    document.execCommand('bold');
    this.toggleButton(e);
  },

  toggleItalic: function(e) {
    document.execCommand('italic');
    this.toggleButton(e);
  },

  toggleUnderline: function(e) {
    document.execCommand('underline');
    this.toggleButton(e);
  },

  toggleLink: function(e) {
    var selection = document.getSelection().toString();
    var url;
    if (!selection) return;

    url = prompt('Enter the URL to link to: ');
    this.createLink(url, e);
  },

  toggleStrikeThrough: function(e) {
    document.execCommand('strikeThrough');
    this.toggleButton(e);
  },

  createLink: function(url, e) {
    if (!url) return;
    document.execCommand('createLink', false, url);
    this.toggleButton(e);
  },

  insertUL: function(e) {
    document.execCommand('insertUnorderedList');
    this.toggleButton(e);
  },

  insertOL: function(e) {
    document.execCommand('insertOrderedList');
    this.toggleButton(e);
  },

  alignLeft: function(e) {
    document.execCommand('justifyLeft');
    this.toggleButton(e);
    this.toggleButtons();
  },

  alignRight: function(e) {
    document.execCommand('justifyRight');
    this.toggleButton(e);
    this.toggleButtons();
  },

  alignCenter: function(e) {
    document.execCommand('justifyCenter');
    this.toggleButton(e);
    this.toggleButtons();
  },

  alignJustify: function(e) {
    document.execCommand('justifyFull');
    this.toggleButton(e);
    this.toggleButtons();
  },

  // add 'pushed' class to button clicked
  toggleButton: function(e) {
    var $btn = $(e.target);
    $btn.toggleClass('pushed');
  },

  // add 'pushed' class to buttons whose actions are applied to current selection
  toggleButtons: function() {
    var isBold = document.queryCommandValue('bold') === 'true';
    var isItalic = document.queryCommandValue('italic') === 'true';
    var isUnderlined = document.queryCommandValue('underline') === 'true';
    var isStrokeThrough = document.queryCommandValue('strikeThrough') === 'true';
    var isALink = document.queryCommandValue('createLink') === 'true';
    var isAnOL = document.queryCommandValue('insertOrderedList') === 'true';
    var isAUL = document.queryCommandValue('insertUnorderedList') === 'true';
    var isAlignLeft = document.queryCommandValue('justifyLeft') === 'true';
    var isAlignRight = document.queryCommandValue('justifyRight') === 'true';
    var isAlignCenter = document.queryCommandValue('justifyCenter') === 'true';
    var isAlignJust = document.queryCommandValue('justifyFull') === 'true';

    $('.bold').toggleClass('pushed', isBold);
    $('.italicize').toggleClass('pushed', isItalic);
    $('.underline').toggleClass('pushed', isUnderlined);
    $('.strikethrough').toggleClass('pushed', isStrokeThrough);
    $('.link').toggleClass('pushed', isALink);
    $('.ul').toggleClass('pushed', isAUL);
    $('.ol').toggleClass('pushed', isAnOL);
    $('.al_left').toggleClass('pushed', isAlignLeft);
    $('.al_right').toggleClass('pushed', isAlignRight);
    $('.al_center').toggleClass('pushed', isAlignCenter);
    $('.al_justify').toggleClass('pushed', isAlignJust);
  },

  init: function() {
    $('button.bold').on('click', this.toggleBold.bind(this));
    $('button.italicize').on('click', this.toggleItalic.bind(this));
    $('button.underline').on('click', this.toggleUnderline.bind(this));
    $('button.link').on('click', this.toggleLink.bind(this));
    $('button.strikethrough').on('click', this.toggleStrikeThrough.bind(this));
    $('button.ul').on('click', this.insertUL.bind(this));
    $('button.ol').on('click', this.insertOL.bind(this));
    $('button.al_left').on('click', this.alignLeft.bind(this));
    $('button.al_right').on('click', this.alignRight.bind(this));
    $('button.al_center').on('click', this.alignCenter.bind(this));
    $('button.al_justify').on('click', this.alignJustify.bind(this));
    document.addEventListener('selectionchange', this.toggleButtons.bind(this));
  }
};

App.init();
