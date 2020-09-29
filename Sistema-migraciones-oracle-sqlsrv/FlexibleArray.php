<?php

class FlexibleArray implements ArrayAccess, Iterator, JsonSerializable {
    public $package = 'Sys';
    public $data = [];

    protected const UPPER    = 'upper';
    protected const LOWER    = 'lower';

    protected $iteratorCurrentKeyIndex = 0;

    // Config
    protected const STORE = self::UPPER;
    
    public function __construct($array = null){
        if ($array !== null) {
            if (self::STORE === self::UPPER) {
                $keys = array_map('strtoupper', array_keys($array));
            } else {
                $keys = array_map('strtolower', array_keys($array));
            }
            $values = array_values($array);
            foreach ($values as $valuekey => $valuevalue) {
                if (is_array($valuevalue)) {
                    $values[$valuekey] = new FlexibleArray($valuevalue);
                }
            }
            $this->data = array_combine($keys, $values);
        } else {
            $this->data = null;
        }

    }

    protected function getConvertedKey($key) {
        if (self::STORE === self::UPPER) {
            $key = strtoupper($key);
        } else {
            $key = strtolower($key);
        }
        return $key;
    }

    /* ArrayAccess implementation */
    public function offsetExists($offset){ return isset($this->data[$offset]); }
    public function offsetGet($offset){
        $offset = $this->getConvertedKey($offset);
        return $this->data[$offset];
    }
    public function offsetSet($offset, $newval){
        $offset = $this->getConvertedKey($offset);
        return $this->data[$offset] = $newval;
    }
    public function offsetUnset($offset){ unset($this->data[$offset]); }

    /* Iterator implementation */

    public function current() {
        $keys = array_keys($this->data);
        $key = $keys[$this->iteratorCurrentKeyIndex];
        return $this->data[$key];
    }

    public function next() {
        $this->iteratorCurrentKeyIndex++;
    }

    public function valid() {
        if ($this->iteratorCurrentKeyIndex >= count(array_keys($this->data))) {
            return false;
        }
        return true;
    }

    public function key() {
        $keys = array_keys($this->data);
        $key = $keys[$this->iteratorCurrentKeyIndex];
        return $key;
    }

    public function rewind() {
        $this->iteratorCurrentKeyIndex = 0;
    }

    /* JsonSerializable implementation */
    public function jsonSerialize() {
        return array_map(function($value){
            return utf8_encode($value);
        }, $this->data);
    }
}