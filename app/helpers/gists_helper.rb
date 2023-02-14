module GistsHelper
  def table_question_link(gist)
    truncate_size = 25
    link_to gist.question.body.truncate(truncate_size), admin_question_path(gist.question)
  end

  def table_gist_link(gist)
    hash = gist.gist_url.split('/').last
    link_to hash, gist.gist_url
  end

  def table_gist_user_email(gist)
    gist.user.email
  end
end
