# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_squeezer_session',
  :secret      => '9ed5ea8f71fd2ae69e545c42e3d9ab13064e99a2f554bbaf1f4ccc3046f00fc2c0787940dcfbef34bce932f9f1b6a7995a64ddc6bb51b7c002a15a52c55e5f5f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
