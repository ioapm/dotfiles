# OpsWorks stack ls
function fowls

  if test -z "$AWS_ACCESS_KEY_ID"
    echo "does not set aws credentials..."
    return
  end

  test -z (aws opsworks describe-stacks --query 'Stacks[*]' | jq '.[]' | head -1); \
    and set -l region "--region us-east-1"
    or  set -l region ""

  # select opsworks stacks
  spin \
    "aws opsworks describe-stacks $region \
      --query 'Stacks[].[Name, StackId]' \
      | jq -r '.[]|@tsv'" \
      | fzf -d\t --with-nth=1 \
      | awk '{print $2}' \
      | read -l stack_id

  if test -z "$stack_id"
    return
  end

  spin \
    "aws opsworks describe-instances $region \
      --stack-id $stack_id \
      --query 'Instances[*].{Hostname:Hostname, Status:Status, InstanceType:InstanceType, Scaling:AutoScalingType, InstanceID:Ec2InstanceId, PrivateIP:PrivateIp, Zone: AvailabilityZone}' \
      --output table \
     | sed 's/None/    /g'"
end
