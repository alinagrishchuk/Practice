**Hotshot objectives**
- Creating and administrating events
- Creating search-friendly URLs for events
- Adding tags to events
- Tagging-based search and tag cloud
- Adding Gravatar for a user
- Creating RSVPs for events
- Adding event moderation
- Creating "My events" to manage events created by users

 create_table "events", force: true do |t|

 
 t.text "agenda"
 t.text "address"
 t.integer "organizer_id"
 t.datetime "created_at"
 t.datetime "updated_at"
 
 rails g scaffold Event title:string start_date:datetime end_date:datetime location:string agenda:text address:text organizer_id:integer 