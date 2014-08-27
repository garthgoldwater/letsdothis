__This app is still a WIP and will continue to be for the next two or three
weeks.__

#Let's Do This

##Summary:
  Let's Do This (if you can think of a better name please email me) is my
capstone project from thoughtbot's Metis program (a 12-week ruby-on-rails
intensive). It aims to help people plan a group activities very quickly and with
minimal friction. It will be on heroku once I finish the first round of styling.
It is part of a larger set of exercises I'm going to be doing for the next few
months as I continue to hone my ruby/rails/js skills. It's also part of a set
of user interface experiments that I'm calling "Ergonomic Data Structures".

##Example Use Case
Have you ever tried to plan anything over Facebook chat that involved:  
  + More than three people, or  
  + More planning than going out to see a movie?  

It's a nightmare. The two most obvious examples are potlucks and camping trips.
You need to keep track of who is bringing what and you have a set of
things that definitely need to be brought by someone. So Let's Do This (again, please help me with the name) lets you
collaborate on a group outline with accompanying chats.  

Hopefully it will become robust enough that you can even "spin off" smaller
groups from larger ones. So say you're planning one of those gargantuan family
reunions that we of the lesser-familied simultaneously envy and fear. You could
spin off a "dessert corps" and they would get their own chat and outline for
coordinating their regiment within the battalion. I apologize for the mixing of
family and military metaphors. It's that "fear and envy" stuff I was referring
to.

##Motivation and Philosophy

There are two major motivations for this project:

1. "Ergonomic Data Structures"  
  I don't know if you're aware, but it's become [very
hip](http://vimeo.com/64895205) to [point out](http://vimeo.com/36579366) that,
in the world of software,
[our tools](https://www.youtube.com/watch?v=52SVAMM3V78) have been [shaping
us](http://vimeo.com/71278954) more than [we've been
shaping](http://vimeo.com/67076984)
[them](http://www.softdistrict.com/wp-content/uploads/2009/11/medical-software2.jpg).
I'm not saying that this is a [new](http://en.wikipedia.org/wiki/Alan_Kay)
[argument](http://en.wikipedia.org/wiki/Douglas_Engelbart), but it seems to be
resurging in popularity among people who actually build things.  
  There are a lot of interesting ways to approach this problem, but I am, in the
grand scheme of things, a *ruby newbie* (a rhyme--how **cute**), so I am
approaching it in a very literal sense. A lot of rails apps look like database
backends dressed in a fancy costume. That's well and good for many problems, but
I think that (from my experience as a user of web apps) the limitations of a
database system designed under the time and space constraints of [the dark ages,
computationally speaking](http://en.wikipedia.org/wiki/SQL#History) often
compels us to use what I'd call **dead data structures**--strings, integers, and
other remnants of the eras when we really needed to care about storage
structures (I'm not [alone](https://www.youtube.com/watch?v=Cym4TZwTCNU
) in this belief).  
  So I'm trying to design apps that don't use those fossils in
expected ways--I want my strings to interact with each other, and have an
algebra, of sorts. Let's Do This isn't a particularly fantastic example of this
kind of design, but it is a start. That's why chats are **related** to subsections
of the outline, and it's why the backbone of the app is the outline's recursive
structure. Rather than encoding structural information inside the **data**, I'm
trying to keep that structural information inside the **interface** and the
**code**. Compare my approach to the approach of markdown: markdown *parses*
strings to **display form**, whereas I'm trying to **interpret semantics** and
**display relationships**. This sounds pretentious for an app because it is. My
goal is to build apps that hold this pretense until I figure out how to
achieve it authentically, "on the regular".

2. Why does every [redacted] web app promising to make my life easier demand
that I jump through a bunch of hoops before I can use it? Do I NEED a user
account for this?! NO. The "user" metaphor has been lazily overapplied and
mostly serves as a cover for netting emails. You only need to give a group a
password and then you can go.
  This (and some other decisions) embodies a commitment I've made to making
**frictionless** apps. We ought interrupt the user as little as possible.
+ "Isn't that just good UI/UX design?"  
  No. UI/UX focuses on solid metaphors, understandable interfaces, and
predictable interactions. I'm talking about **user interface engineering**. This
is an arbitrary distinction I'm making because I identify as a maverick, a
renegade, and a cop who doesn't play by the rules.

##Mildly Interesting Code Features
+ I've eliminated a few of them in the course of a refactor already
+ I **am** using recursive partials. There are some tricky things about them. You
can look at the document partial if you'd like.

##Lessons Learned

*I think we should rename the Minimum Viable Product the Minimum-Effort Core
Mechanic. "Core mechanic" is a vocab term I'm stealing from a particularly good
[game design textbook](http://en.wikipedia.org/wiki/Rules_of_Play), and it
basically means "the thing that a player does repeatedly in a game" -- in poker,
it's betting. In Risk, it's conquering. Et cetera. In this app, it's chatting,
and I should've focused more on getting to that particular feature, earlier on.
"Minimum Effort" means: *use [redacted] gems, you [redacted]*. If I had used
Monban or Devise I could've gotten to that mechanic in thirty minutes. Instead I
overfocused on the "no user accounts" selling point and spent a lot of time
fiddling with signed cookies and sessions and naming schemes when I could've
just added a GuestsController after I had figured out the interface that these
theoretical users would be using.
*If you're going to start a project to demonstrate skills in some area, pick a
project that demonstrates that you can do some of the stuff other people are
doing, not stuff you think would be cool. It's easier and more impressive.

##Roadmap
*Obviously, the interface needs to be worked out. That's going to happen in
the next week or two as I learn ember.js, since this app is a good candidate for
the "single-page" style that all the cool teens are clamoring for.
*Since this is supposed to be a chat app, it should be using websockets.
Oops. I've used [pusher](https://pusher.com/) before so I might try rolling my
own WebSockets this time.
*On a similar front, I need to work out what notifications look like in a
hierarchical context. Should subdocuments notify their parent documents?
*All the obvious bells and whistles -- e.g.: file upload, email notifications,
user accounts to save groups, tags, multiple documents for each group, etc
*I'm going to clean up the recent commit messages tomorrow. Today's been
pretty crazy.
