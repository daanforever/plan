class WelcomeCommander < Fie::Commander
  pool :notification do
    execute_js_function("console.log", @published_object)
  end

  def uuid
    @connection_uuid
  end
end