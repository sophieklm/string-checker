# Brief

Write some code that tests if two equal-length strings differ by a single character, irrespective of case.

E.g.

```
differ_by_one?("dog", "cat")
=> false
differ_by_one?("cat", "HAT")
=> true
differ_by_one?("hat", "that")
Error
```

Assumptions made:

- order of characters is not important
  i.e. differ_by_one?("car", “act”) => true
- spaces count as characters in a string that can differ

See spec file for all cases tested

# Test

```
rspec string_checker_spec.rb
```
