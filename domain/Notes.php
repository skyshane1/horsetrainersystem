<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Notes {
    private $horseName; //string
    private $noteDate; //date format
    private $noteTimestamp; //timestamp
    private $note; //string
    private $trainerFirstName; //string
    private $trainerLastName; //string
    
    function __construct($horseName, $date, $timestamp, $note, $trainerFirstName, $trainerLastName) {
            $this->horseName = $horseName;
            $this->noteDate = $date;
            $this->noteTimestamp = $timestamp;
            $this->note = $note;
            $this->trainerFirstName = $trainerFirstName;
            $this->trainerLastName = $trainerLastName;
    }
    function get_horseName() {
        return $this->horseName;
    }
    function get_date() {
        return $this->noteDate;
    }
    function get_timestamp() {
        return $this->noteTimestamp;
    }
    function get_note() {
        return $this->note;
    }
    function get_trainerFirstName() {
        return $this->trainerFirstName;
    }
    function get_trainerLastName() {
        return $this->trainerLastName;
    }
}