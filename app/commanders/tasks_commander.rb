class TasksCommander < Fie::Commander
  pool :say do
    state.message = @published_object
  end
end
