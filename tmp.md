in a conversation: who are you talking to?
  -the group
  -commenting on an action
  -responding to something someone said
    -are you responding to
      -the group?
      -the message?
      -the person?
  -talking about a specific topic

when planning, you could be:
  -tossing action items out there
  -enumerating a list
  -explaining something
  -asking a question
  -answering a question
  -putting up a resource
  -assigning a task to someone
  -adding neccesary requirements
  -adding details to something

a group has_many projects
project has a chat and a document
a document has a body and a title or a name and has_many documents, as subdocuments
a document has a chat



render project.top_level_documents

    _document.html.erb = 

    <h3><%= document.title %></h3>
    <%= document.body %>
    <%= document.chat %>
    <%= render document.subdocuments %>




