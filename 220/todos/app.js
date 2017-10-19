var todoItems = [{id: 1, title: 'Homework'},
                {id: 2, title: 'Shopping'},
                {id: 3, title: 'Calling Mom'},
                {id: 4, title: 'Coffee with John'}];

var App = {
  todos: todoItems,
  todosTemplate: Handlebars.compile($('#todos_template').html()),
  confirmTemplate: Handlebars.compile($('#confirm_template').html()),
  $todos: $('ul#todos'),
  $confirm: $('.confirm_prompt'),

  renderTodos: function() {
    this.$todos.html(this.todosTemplate({ todos: this.todos }));
  },

  handleDeleteClick: function(e) {
    e.preventDefault();
    var todoId   = Number($(e.target).closest('li').attr('data-id'));
    this.showPrompt(todoId);
  },

  handleConfirmYes: function(e) {
    var todoId = Number($(e.target).closest('.confirm_wrapper').attr('data-id'));
    e.preventDefault();
    this.removeTodo(todoId);
  },

  removeTodo: function(id) {
    this.todos = this.todos.filter(function(todo) {
      return todo.id !== id;
    });

    this.hidePrompt();
    this.renderTodos();
  },

  showPrompt: function(todoId) {
    this.$confirm.html(this.confirmTemplate({id: todoId}));
    this.$confirm.add('.overlay').show();
    this.bindPromptEvents();
  },

  bindPromptEvents: function() {
    this.$confirm.one('click', '.confirm_no', this.hidePrompt.bind(this));
    this.$confirm.one('click', '.confirm_yes', this.handleConfirmYes.bind(this));
  },

  hidePrompt: function() {
    this.$confirm.add('.overlay').hide();
  },

  init: function() {
    this.renderTodos();
    this.$todos.on('click', 'li .remove', this.handleDeleteClick.bind(this));
    $('.overlay').on('click', this.hidePrompt.bind(this));
  }
};

App.init();
