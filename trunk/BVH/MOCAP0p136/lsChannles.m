function Tables=lsChannel(ske)
inode=1;
ic=1;
Tables=cell(2,1)
for t=ske.tree(1:end)
	
	name=t.name
	for c=t.channels
	c
	Tables(end+1).name=name;
	Tables(end).channel=c;
	end
end
i=0
for t=Tables(1:end)
	i=i+1;
	index=i
	name=t.name
	channel=t.channel
end

