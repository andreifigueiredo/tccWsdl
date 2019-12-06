json.set! :data do
  json.array! @teams do |team|
    json.partial! 'teams/team', team: team
    json.url  "
              #{link_to 'Show', team }
              #{link_to 'Edit', edit_team_path(team)}
              #{link_to 'Destroy', team, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end