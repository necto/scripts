emacs -batch doc/plans/counted-chains-map-opt-plan.org --eval "(org-clock-display)" 2>&1 | sed 's/.*(\([0-9]*\) hours and \([0-9]*\) minutes)/\1*60 + \2/' | bc
