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
}) 

t2 = Teacher.create({
	first_name: 'Michele',
	last_name: 'Dennis',
	email: 'michele.dennis@mastersny.org',
	password: 'pass',
	password_confirmation: 'pass',
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

c2 = Course.create({ name: 'Algebra' })

c3 = Course.create({ name: 'Calculus' })

c4 = Course.create({ name: 'Trigonometry' })

ReviewSession.destroy_all

rs1 = ReviewSession.create({course: c1, teacher: t1, title: 'Geometry Review 1'})
rs2 = ReviewSession.create({course: c1, teacher: t1, title: 'Geometry Review 2'})
rs3 = ReviewSession.create({course: c1, teacher: t1, title: 'Geometry Review 3'})
rs4 = ReviewSession.create({course: c1, teacher: t1, title: 'Geometry Review 4'})

rs5 = ReviewSession.create({course: c2, teacher: t1, title: 'Algebra Review 1'})
rs6 = ReviewSession.create({course: c2, teacher: t1, title: 'Algebra Review 2'})
rs7 = ReviewSession.create({course: c2, teacher: t1, title: 'Algebra Review 3'})
rs8 = ReviewSession.create({course: c2, teacher: t1, title: 'Algebra Review 4'})

rs9 = ReviewSession.create({course: c3, teacher: t1, title: 'Calculus Review 1'})
rs10 = ReviewSession.create({course: c3, teacher: t1, title: 'Calculus Review 2'})
rs11 = ReviewSession.create({course: c3, teacher: t1, title: 'Calculus Review 3'})
rs12 = ReviewSession.create({course: c3, teacher: t1, title: 'Calculus Review 4'})

rs13 = ReviewSession.create({course: c4, teacher: t1, title: 'Trigonometry Review 1'})
rs14 = ReviewSession.create({course: c4, teacher: t1, title: 'Trigonometry Review 2'})
rs15 = ReviewSession.create({course: c4, teacher: t1, title: 'Trigonometry Review 3'})
rs16 = ReviewSession.create({course: c4, teacher: t1, title: 'Trigonometry Review 4'})