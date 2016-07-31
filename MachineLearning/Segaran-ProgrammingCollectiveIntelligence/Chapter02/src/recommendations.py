import math

# A dictionary of movie critics and their ratings of a small set of movies
prefs = {
    'Lisa Rose' : 
        {
            'Lady in the Water' : 2.5, 'Snakes on a Plane' : 3.5,
            'Just My Luck' : 3.0, 'Superman Returns' : 3.5, 
            'You, Me and Dupree' : 2.5, 'The Night Listener' : 3.0
        },

    'Gene Seymour' : 
        {
            'Lady in the Water' : 3.0, 'Snakes on a Plane' : 3.5,
            'Just My Luck' : 1.5, 'Superman Returns' : 5.0, 
            'The Night Listener' : 3.0, 'You, Me and Dupree' : 3.5
        },

    'Michael Phillips' : 
        {
            'Lady in the Water' : 2.5, 'Snakes on a Plane' : 3.0,
            'Superman Returns' : 3.5, 'The Night Listener' : 4.0
        },

    'Claudia Puig' : 
        {
            'Snakes on a Plane' : 3.5, 'Just My Luck' : 3.0,
            'The Night Listener' : 4.5, 'Superman Returns' : 4.0,
            'You, Me and Dupree' : 2.5
        },

    'Mick LaSalle' : 
        {
            'Lady in the Water' : 3.0, 'Snakes on a Plane' : 4.0,
            'Just My Luck' : 2.0, 'Superman Returns' : 3.0, 
            'The Night Listener' : 3.0, 'You, Me and Dupree' : 2.0
        },

    'Jack Matthews' : 
        {
            'Lady in the Water' : 3.0, 'Snakes on a Plane' : 4.0,
            'The Night Listener' : 3.0, 'Superman Returns' : 5.0, 
            'You, Me and Dupree' : 3.5
        },

    'Toby' : 
        {
            'Snakes on a Plane' : 4.5, 'You, Me and Dupree' : 1.0,
            'Superman Returns' : 4.0
        }
}

def similarity_euclidean(prefs, person1, person2):
    common = [itm for itm in prefs[person1] \
        if itm in prefs[person2]]

    distance = [pow(prefs[person1][itm] - prefs[person2][itm], 2) \
        for itm in common]

    return 1 / (1 + sum(distance))

def similarity_pearson(prefs, person1, person2):
    common = [itm for itm in prefs[person1] \
        if itm in prefs[person2]]

    n = len(common)

    if n == 0:
        return 0

    s1 = sum([prefs[person1][m] for m in common])
    s2 = sum([prefs[person2][m] for m in common])

    ss1 = sum([pow(prefs[person1][m], 2) for m in common])
    ss2 = sum([pow(prefs[person2][m], 2) for m in common])

    ps = sum([prefs[person1][m] * prefs[person2][m] for m in common])

    num = ps - ((s1 * s2) / n)
    den = math.sqrt((ss1 - pow(s1, 2) / n) * (ss2 - pow(s2, 2) / n))

    return num / den if den != 0 else 0

def top_matches(prefs, person, bound, similarity):
    scores = [(similarity(prefs,person,other),other) \
                for other in prefs if other != person]

    scores.sort()
    scores.reverse()
    return scores[0:bound]

def recommend(prefs, person, bound=5, similarity=similarity_pearson):
    scores = top_matches(prefs, person, bound, similarity)
    recommendations = {}

    for sim, other in scores:
        ranked = prefs[other]

        for movie in ranked:           
            if movie not in prefs[person]:
                weighted_score = sim * ranked[movie]

                if movie in recommendations:
                    s, weighted_scores = recommendations[movie]
                    recommendations[movie] = (s + sim, weighted_scores + [weighted_score])
                else:
                    recommendations[movie] = (sim, [weighted_score])

    for r in recommendations:
        sim, data = recommendations[r]
        recommendations[r] = sum(data) / sim

    return recommendations

def transform_prefs(prefs):
    result = {}

    for person in prefs:
        for item in prefs[person]:
            result.setdefault(item, {})
            result[item][person] = prefs[person][item]

    return result

def get_similar_items(prefs, n = 10):
    result = {}
    item_prefs = transform_prefs(prefs)
    c = 0

    for item in item_prefs:

        c += 1
        if c % 100 == 0: 
            print "%d / %d" % (c, len(item_prefs))

        scores = top_matches(item_prefs, item, n, similarity_euclidean)
        result[item] = scores

    return result

def recommend_items(person, prefs, items_ranking):

    ranked_movies = prefs[person]
    scores = {}
    weighted_scores = {}

    for movie in ranked_movies:
        rating = ranked_movies[movie]

        for r, m in items_ranking[movie]:

            if m in ranked_movies:
                continue

            weighted_score = r * rating

            if m in scores:
                scores[m] += r
                weighted_scores[m] += weighted_score
            else:
                scores[m] = r
                weighted_scores[m] = weighted_score

    result = [(weighted_scores[m] / scores[m], m) for m in scores]
    result.sort()
    result.reverse()

    return result