module ApplicationHelper
  def self.matches(current_user)
    potential_matches = User.where.not( id: User.matchers_rejected(User.matchers(current_user)) )
    more_potential_matches = potential_matches.where.not( id: User.matchees_rejected(User.matchers(current_user)) )
    all_matches = more_potential_matches.concat( User.matchees_selected(User.matchers(current_user)) ).to_a
    all_matches.reverse.take(30).shuffle
  end
end
