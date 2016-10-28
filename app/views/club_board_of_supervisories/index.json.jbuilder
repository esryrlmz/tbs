json.array!(@club_board_of_supervisories) do |club_board_of_supervisory|
  json.extract! club_board_of_supervisory, :id, :period_id, :principal_member_one, :principal_member_two, :principal_member_three, :reserve_member_one, :reserve_member_two, :reserve_member_three
  json.url club_board_of_supervisory_url(club_board_of_supervisory, format: :json)
end
