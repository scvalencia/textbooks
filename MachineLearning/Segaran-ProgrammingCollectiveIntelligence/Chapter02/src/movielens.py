import recommendations

class Movie(object):

	def __init__(self, movie_id, movie_title):

		self.movie_id = movie_id
		self.movie_title = movie_title

def load_movies():

	movies = {}

	filename = 'data/ml-100k/u.item'
	fileobject = open(filename, 'r')

	for line in fileobject:
		line = line.strip()
		line = line.split('|')

		movie_id, movie_title = line[0], line[1]
		movie = Movie(movie_id, movie_title)
		movies[movie_id] = movie

	return movies

def load_ratings(movies):

	ratings = {}

	filename = 'data/ml-100k/u.data'
	fileobject = open(filename, 'r')

	for line in fileobject:
		line = line.strip()
		line  = line.split()

		user_id, movie_id = int(line[0]), line[1]
		vote = float(line[2])

		movie_name = movies[movie_id].movie_title

		if user_id in ratings:
			ratings[user_id][movie_name] = vote
		else:
			ratings[user_id] = {movie_name : vote}

	return ratings




def main():
	movies = load_movies()
	ratings = load_ratings(movies)

	print recommendations.recommend(ratings, 87, 50)

if __name__ == '__main__':
	main()