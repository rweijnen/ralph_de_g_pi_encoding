function DecodeString([string]$EncodedString)
{
	$result = ''
	# array of a..z with a dummy character (space) to make a start at index 1
	$alphabet = ' abcdefghijklmnopqrstuvwxyz'
	
	# convert to string, remove digit and prepend a space to make index start at 1
	$pi = ' ' + [math]::pi.ToString().Replace('.', '')
	
	$i = 0;
	# could have used a regex but quicker to just iterate over the characters
	while ($i -lt $EncodedString.Length)
	{
		$temp = $EncodedString.Substring($i, $EncodedString.Length-$i)
		
		if ($temp[0] -ne '(')
		{
			# only lowercase a-z are encoded, other characters are not encoded
			$result += $EncodedString[$i]
			$i++
		}
		else
		{
			# capture digits groups, eg (6+13) or (2)
			$value = ([RegEx]::Match($temp, '\((.*?)\)')).Value
			# advance the index with the string length
			$i += $value.Length
			
			# get rid of the brackets 
			$value = $value.Substring(1, $value.Length - 2)
			
			# split at + character
			$arr = $value -split '\+'
			$sum = 0
			
			# sum all the values (where each value is the nth Pi digit)
			foreach ($val in $arr)
			{
				$sum += [int]::Parse($pi[$val])
			}
			
			# get the matching alphabet character
			$result += $alphabet[$sum]
		}
	}
	
	return $result
}
