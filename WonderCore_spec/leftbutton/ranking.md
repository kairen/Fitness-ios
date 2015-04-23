# Ranking
####Challenge Result

Model Fields

```
{
    id:<(string) id of object>,
    user:<(User) user that the result belongs to>,
    group:<(Group) the group that the result belongs to>,
    challenge:<(Challenge) Challenge that the result is for>,
    challengeDate:<(int) unix timestamp of start of day in client local timezone>,
    sessions:<(array) list of associated sessions>,
    value:<(float) score of the result in wonder points>
}```
---
#### Get challenge rankings


POST /api/challengeresult/find

SEND

```
{
    challenge:<(string) id of challenge>,
    sort:'value DESC',
    limit:<(int) page size>,
    skip:<(int) page * page size>
}```

RECV SUCCESS

```
{
    result:0
    data:<(ChallengeResult[]) list of ChallengeResult objects>,
    count:<(int) total count>
}```
---
#### Get personal challenge results


POST /api/challengeresult/find

SEND

```
{
    challenge:<(string) id of challenge>,
    sort:'challengeDate DESC',
    challengeDate:{
        '>=':<(int) unix timestamp of start date>,
        '<=':<(int) unix timestamp of end date>,
    },
    limit:<(int) page size>,
    skip:<(int) page * page size>
}```

RECV SUCCESS

```
{
    result:0
    data:<(ChallengeResult[]) list of ChallengeResult objects>,
    count:<(int) total count>
}```

see the section on [ranking](#Login).
