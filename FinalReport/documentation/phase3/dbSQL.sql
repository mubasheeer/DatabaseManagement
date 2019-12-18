/* RETRIEVE THE FIRST NAME , NUMBER OF LIKES AND COMMENT CONTENT RECIEVED 
   BY THE USERS WHO POSTED ON THE SOCIAL MEDIA .
   PERFORMING JOIN ON:PROFILE , POST AND COMMENT*/ 
SELECT
    idprofileid,
    profile.fname AS name,
    post.likescount AS likes,
    comments.content AS content
FROM
    profile
    INNER JOIN post ON post.USER = profile.idprofileid
    INNER JOIN comments ON comments.onpost = post.postid;


/*POST HAVING LIKES MORE THAN 1*/

SELECT postid, SUM(likescount) FROM post 
GROUP BY postid
HAVING SUM(likescount)>1;

/*NAMES OF ALL THE USERS REGISTERED FOR EVENTS*/ 

SELECT profile.`fname` , profile.`lname` , registereduser.`eventid`
FROM `profile` , `registereduser`
WHERE registereduser.`userprofile`=profile.`idprofileid`;

/* retrieve posts with maximum likes*/
SELECT post.`postid` ,post.`likescount`
FROM post 
GROUP BY post.`postid`
HAVING MAX(post.`likescount`);

/*Show the number of users registered for events in descending */

SELECT registereduser.`userprofile` , count(*) FROM registereduser
GROUP BY registereduser.`userprofile` 
ORDER BY registereduser.`eventid` DESC;




