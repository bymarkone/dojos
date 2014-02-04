/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar feedback;

phrases     : phrase+;
phrase      : verb object property parent_ref? SEMICOLON;
verb        : VERBS;
object      : OBJECTS;
parent_ref  : PREP parent;
parent      : QUOTEDID;
property    : (simple | complex)*;
simple      : QUOTEDID;
complex     : WITH pair (AND pair)*;
pair        : name simple;
name        : ID;

VERBS       :       ('add'|'report');
OBJECTS     :       ('Area'|'Topic'|'Action'|'Feedback'|'Progress');
PREP        :       FOR | INTO | ON;

INTO        :       ('into'|'INTO');
FOR         :       ('for'|'FOR');
ON          :       ('on'|'ON');
WITH        :       ('with'|'WITH');
AND         :       ('and'|'AND');

ID          :       ('a'..'z'|'A'..'Z'|'0'..'9')+;
QUOTEDID    :       QUOTES (ESC|.)*? QUOTES;
ESC         :       '\\"' | '\\\\' ;
SEMICOLON   :       ';';
QUOTES      :       '\''|'\"';
WS          :       (' '|'\t')+ -> skip;
NEWLINE     :       ('\r'? '\n') -> skip;
LP          :       '(';
RP          :       ')';






        