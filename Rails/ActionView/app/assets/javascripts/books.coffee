#jQuery ->
# $("#book_author_ids").chosen()


jQuery ->
  $('#book_author_tokens').tokenInput '/authors.json',
    theme: 'facebook',
    prePopulate: $('#book_author_tokens').data('load')

