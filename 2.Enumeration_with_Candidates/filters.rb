# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program


def find(id)
    @candidates.select do |candidate|
        candidate[:id] == id
    end
end

def experienced?(candidate)
    (candidate[:years_of_experience] >= 2)
end

def qualified_candidates(candidates)
    list = @candidates.select do |candidate|
        experienced?(candidate) && enoughGithubPoint?(candidate, 100) && knowAtleastOne?(candidate, 'Ruby', 'Python') && appliedTime?(candidate, 15) && overAge?(candidate, 18)
    end
    ordered_by_qualifications(list)
end

def ordered_by_qualifications(list)
    list.sort_by {|n| [n[:years_of_experience], n[:github_points]]}.reverse
end

# More methods will go below

def enoughGithubPoint?(candidate, point)
    (candidate[:github_points] >= point)
end

def knowAtleastOne?(candidate, lang1, lang2)
    (candidate[:languages].include?(lang1) || candidate.include?(lang2))
end

def appliedTime?(candidate, day)
    (candidate[:date_applied] >= day.days.ago.to_date)
end

def overAge?(candidate, age)
    (candidate[:age] >= age)
end