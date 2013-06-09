module WorksHelper
  def loadWorksEachYears
    if current_user
      works = User.find(current_user.id).works;
    elsif current_guest
      works = User.find(current_guest.user_id).works;
    end
    
    tmpYears = { }

    for w in works
      year = w.year
      if tmpYears[year] == nil
        tmpYears[year] = []
      end
      tmpYears[year].push w
    end
    keys = tmpYears.keys.sort

    years = []
    for k in keys
      years.push tmpYears[k]
    end

    years.reverse
  end
end
