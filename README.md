# SquareUp
## By Brian Fu, Ryan Lau, Michael Ramuta, Nicholas Stelter

### A social app focused on pick-up sports that will allow users to connect with others based on their selected sport and skill level

### Standups
#### General Guidelines
1. Talk about what you did after the last standup
2. What your plan is to do before the next standup
3. What is blocking your progress?
4. Times to meet
  * 8:00am - Beginning of the Day
  * 11:25am - Before Lunch
  * 1:00pm - After Lunch
  * 5:00pm - Debrief for the end of the day
5. End of Day Debrief
  * In addition, explain how the day went
  * Look over code that needs refactoring
  * Plan what needs to be done until the next standup
6. If there are any Gems or cool tech spikes, lightning talks to share with the group

### Git Workflow
1. Take small vertical slices
  * Commit often
  * Vertical includes
    * Testing: Unit, Controller, Capybara, Jasmine
    * Models
    * Controllers
    * Views
    * Any required JS
2. How to push
  1. When you're ready, call over another team member
  2. Demo what you've done locally
  3. The team member will look over the code, point out refactoring that may need to be done
  4. You go over the code by yourself again and refactor
  5. Team member will review again and will be the one to merge it into master
  6. It is the team member's responsibility to tell the other two team members to pull from master
3. Merge Conflicts
  1. Pull down from master
  2. Merge master into your branch
  3. Resolve any conflicts
  4. Push the file
