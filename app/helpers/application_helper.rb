module ApplicationHelper


def format_name(user)
    if user.gender == "male"
      "Mr. #{user.name}"
    elsif user.gender == "female"
      "Ms. #{user.name}"
  else
    user.name
    end
end
end
