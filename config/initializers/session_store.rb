# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ieasy_session',
  :secret      => '7ed2457bf2a58f5b3b6f0e045ec130f8794df7ba3db7c6672c0197701ac02e076fbac5425e150b13c0ba71d7b6593563d112ead78cc40550f30cff65a523e277'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
