# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Teacher.destroy_all

t1 = Teacher.create({
	first_name: 'Michael',
	last_name: 'Dennis',
	email: 'michaelsdennis4@gmail.com',
	password: 'juliank',
	password_confirmation: 'juliank',
	is_admin: true
}) 

t2 = Teacher.create({
	first_name: 'Michele',
	last_name: 'Dennis',
	email: 'michele.dennis@mastersny.org',
	password: 'zizu',
	password_confirmation: 'zizu',
	is_admin: false
})

t3 = Teacher.create({
	first_name: 'Guest',
	last_name: 'User',
	email: 'guest@guest.com',
	password: 'guest',
	password_confirmation: 'guest',
	is_admin: false
})

Student.destroy_all

s1 = Student.create({
	first_name: 'Julian',
	last_name: 'Dennis',
	email: 'julian.dennis@mastersny.org',
	password: 'pass',
	password_confirmation: 'pass',
	grad_year: 2021
})

s2 = Student.create({
	first_name: 'Miranda',
	last_name: 'Dennis',
	email: 'miranda.dennis@mastersny.org',
	password: 'pass',
	password_confirmation: 'pass',
	grad_year: 2023
})

Course.destroy_all

c1 = Course.create({ name: 'Geometry' })

# c2 = Course.create({ name: 'Algebra' })

# c3 = Course.create({ name: 'Calculus' })

# c4 = Course.create({ name: 'Trigonometry' })

ReviewSession.destroy_all

Unit.destroy_all

Topic.destroy_all

ReviewQuestion.destroy_all

ReviewAnswer.destroy_all

Assessment.destroy_all

TestQuestion.destroy_all

Choice.destroy_all

Response.destroy_all


2.times do |i|
	rs = ReviewSession.create({course: c1, teacher: t3, title: "Geometry Review #{i+1}"})
	Assessment.create({student: s1, review_session: rs})
	Assessment.create({student: s2, review_session: rs})
	10.times do |j|
		tq = TestQuestion.create({review_session: rs, question_text: "sample test question"})
		ch1 = Choice.create({test_question: tq, choice_text: 'choice a'})
		ch2 = Choice.create({test_question: tq, choice_text: 'choice b'})
		ch3 = Choice.create({test_question: tq, choice_text: 'choice c'})
		ch4 = Choice.create({test_question: tq, choice_text: 'choice d'})
		tq.update({correct_answer: ch2.id});
	end
	3.times do |j|
		u = Unit.create({review_session: rs, title: "Geometry Unit #{j+1}"})
		5.times do |k|
			tq = TestQuestion.create({unit: u, question_text: "sample quiz question"})
			ch1 = Choice.create({test_question: tq, choice_text: 'choice a'})
			ch2 = Choice.create({test_question: tq, choice_text: 'choice b'})
			ch3 = Choice.create({test_question: tq, choice_text: 'choice c'})
			ch4 = Choice.create({test_question: tq, choice_text: 'choice d'})
			tq.update({correct_answer: ch2.id});
		end
		3.times do |k|
			t = Topic.create({unit: u, title: "Geometry Unit #{j+1} Topic #{k+1}"})
			5.times do |q|
				rq = ReviewQuestion.create({topic: t, question_text: "Geometry Unit #{j+1} Topic #{k+1} Question #{q+1}"})
				ra = ReviewAnswer.create({review_question: rq, answer_text: "this is the answer"})
			end
		end
	end
end

# 4.times do |i|
# 	rs = ReviewSession.create({course: c2, teacher: t1, title: "Algebra Review #{i+1}"})
# 	Assessment.create({student: s1, review_session: rs})
# 	Assessment.create({student: s2, review_session: rs})
# 	10.times do |j|
# 		tq = TestQuestion.create({review_session: rs, question_text: "sample question"})
# 		ch1 = Choice.create({test_question: tq, choice_text: 'choice a'})
# 		ch2 = Choice.create({test_question: tq, choice_text: 'choice b'})
# 		ch3 = Choice.create({test_question: tq, choice_text: 'choice c'})
# 		ch4 = Choice.create({test_question: tq, choice_text: 'choice d'})
# 		ch5 = Choice.create({test_question: tq, choice_text: 'choice e'})
# 		tq.update({correct_answer: ch2.id});
# 	end
# 	10.times do |j|
# 		u = Unit.create({review_session: rs, title: "Algebra Unit #{j+1}"})
# 		10.times do |k|
# 			t = Topic.create({unit: u, title: "Algebra Unit #{j+1} Topic #{k+1}"})
# 			10.times do |q|
# 				rq = ReviewQuestion.create({topic: t, question_text: "Algebra Unit #{j+1} Topic #{k+1} Question #{q+1}"})
					# ra = ReviewAnswer.create({review_question: rq, answer_text: "this is the answer"})
# 			end
# 		end
# 	end
# end

# 4.times do |i|
# 	rs = ReviewSession.create({course: c3, teacher: t1, title: "Calculus Review #{i+1}"})
# 	Assessment.create({student: s1, review_session: rs})
# 	Assessment.create({student: s2, review_session: rs})
# 	10.times do |j|
# 		tq = TestQuestion.create({review_session: rs, question_text: "sample question"})
# 		ch1 = Choice.create({test_question: tq, choice_text: 'choice a'})
# 		ch2 = Choice.create({test_question: tq, choice_text: 'choice b'})
# 		ch3 = Choice.create({test_question: tq, choice_text: 'choice c'})
# 		ch4 = Choice.create({test_question: tq, choice_text: 'choice d'})
# 		ch5 = Choice.create({test_question: tq, choice_text: 'choice e'})
# 		tq.update({correct_answer: ch3.id});
# 	end
# 	10.times do |j|
# 		u = Unit.create({review_session: rs, title: "Calculus Unit #{j+1}"})
# 		10.times do |k|
# 			t = Topic.create({unit: u, title: "Calculus Unit #{j+1} Topic #{k+1}"})
# 			10.times do |q|
# 				rq = ReviewQuestion.create({topic: t, question_text: "Calculus Unit #{j+1} Topic #{k+1} Question #{q+1}"})
					# ra = ReviewAnswer.create({review_question: rq, answer_text: "this is the answer"})
# 			end
# 		end
# 	end
# end

# 4.times do |i|
# 	rs = ReviewSession.create({course: c4, teacher: t1, title: "Trigonometry Review #{i+1}"})
# 	Assessment.create({student: s1, review_session: rs})
# 	Assessment.create({student: s2, review_session: rs})
# 	10.times do |j|
# 		tq = TestQuestion.create({review_session: rs, question_text: "sample question"})
# 		ch1 = Choice.create({test_question: tq, choice_text: 'choice a'})
# 		ch2 = Choice.create({test_question: tq, choice_text: 'choice b'})
# 		ch3 = Choice.create({test_question: tq, choice_text: 'choice c'})
# 		ch4 = Choice.create({test_question: tq, choice_text: 'choice d'})
# 		ch5 = Choice.create({test_question: tq, choice_text: 'choice e'})
# 		tq.update({correct_answer: ch4.id});
# 	end
# 	10.times do |j|
# 		u = Unit.create({review_session: rs, title: "Trigonometry Unit #{j+1}"})
# 		10.times do |k|
# 			t = Topic.create({unit: u, title: "Trigonometry Unit #{j+1} Topic #{k+1}"})
# 			10.times do |q|
# 				rq = ReviewQuestion.create({topic: t, question_text: "Trigonometry Unit #{j+1} Topic #{k+1} Question #{q+1}"})
					# ra = ReviewAnswer.create({review_question: rq, answer_text: "this is the answer"})
# 			end
# 		end
# 	end
# end












