module WorksLoader
  def loadWorksEachYears
    works = User.find(current_guest.user_id).works;
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

    years
  end
end
