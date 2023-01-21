<?php

/* 
 * Behavior.php: a PHP file acting as a class file for Behavior objects.
 */
class Behavior {
   private $title; //string
   private $behaviorLevel; //string
   
   function __construct($title, $behaviorLevel) {
       $this->title = $title;
       $this->behaviorLevel = $behaviorLevel;
   }
   function get_title() {
       return $this->title;
   }
   function get_behaviorLevel() {
       return $this->behaviorLevel;
   }
}
