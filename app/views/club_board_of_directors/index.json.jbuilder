json.array!(@club_board_of_directors) do |club_board_of_director|
  json.extract! club_board_of_director, :id, :period_id, :president_id, :vice_president_id, :accountant_id, :secretary_id, :member_one, :member_two, :member_three
  json.url club_board_of_director_url(club_board_of_director, format: :json)
end
