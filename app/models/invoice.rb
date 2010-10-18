class Invoice < ActiveRecord::Base
  FREQUENCY = {"weekly" => "w",  "2 weeks" => "2w", "4 weeks" => "4m", "monthly" => "m", "2 months" => "2m", "3 months" => "3m", "6 months" => "6m", "yearly" => "y", "2 years" => "2y", "3 years" => "3y"}
  STATUS = {"disputed" => 0, "draft" => 1, "sent" => 2, "viewed" => 3, "paid" => 4, "auto-paid" => 5,  "retry" => 6, "failed" => 7, "partial" => 8}
end