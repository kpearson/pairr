module ApplicationHelper
  def self.matches(current_user)
    matchers_not_rejected = User.where.not( id: User.matchers_rejected(User.matchers(current_user)) )
    matches = matchers_not_rejected.where.not( id: User.matchees_rejected(User.matchers(current_user)) )
    matches = matches.concat( User.matchees_selected(User.matchers(current_user)) ).to_a
    matches
  end
end
