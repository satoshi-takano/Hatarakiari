module WorksHelper
  def getWorksEachYears(user)
    works = user.works
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

  def getAllRoles(user)
    works = user.works
    allRoles = { }

    for w in works
      roles = w.roles
      for r in roles
        allRoles[r] = allRoles[r] || 0
        allRoles[r] += 1
      end
    end

    allRoles
  end
end
