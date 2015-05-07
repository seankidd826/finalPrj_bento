json.array!(@admin_stories) do |admin_story|
  json.extract! admin_story, :id, :momheader, :momcontents, :momcontents_1, :momcontents_2, :momcontents_3
  json.url admin_story_url(admin_story, format: :json)
end
