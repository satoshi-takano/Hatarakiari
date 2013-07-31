module WorksHelper
  def loadWorksEachYears(user_id)
    works = User.find(user_id).works;
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
      years.push tmpYears[k].reverse
    end

    years.reverse
  end
end
