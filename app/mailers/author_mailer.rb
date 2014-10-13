#encoding: utf-8
class AuthorMailer < ActionMailer::Base
	def new_story_mail(story)
		subject = "[ISFiT] [The global infection] New story"
		body = "A new story has been submitted. For validating it, go to https://internal.isfit.org/campaign_stories/#{story.id}" 
		mail(to: "johasoru@isfit.org", from: "orakel@isfit.org", subject: subject, body: body)
	end
end