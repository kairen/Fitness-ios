# My Team
####Team

Model Fields

```
{
    id:<(string) team id>,
    title: <(string) title of team>,
    description: <(string) team description>,
    creator: <(User) creator of team>,
    invitations:<(User[]) array of users invited to the team>,
    members: <(User[]) array of users in this team>,
}```
---
#### Get list of invited teams

POST /api/team/find

```
{
    invitations:<(string) your user id>,
    members:{
        'not':<(string) your user id>
    }
}```
---
#### Create a team

POST /api/team

SEND

```
{
    title:<(string) title of team>,
    description:<(string) description>,
    creator:<(string) id of creator>,
    invitations:<(string[]) array of invited users>
}```
---

#### Accept a team invitation

PUT /api/team/:id

SEND

```
{
    members:<(string[]) new list of invited user ids>
}```
