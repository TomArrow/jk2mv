#ifdef _DONETPROFILE_

#include <winsock2.h>
#include <windows.h>
#include <stdio.h>
#include <assert.h>
#include "hstring.h"
#include "INetProfile.h"

//using namespace std;

class CNetProfile : public INetProfile
{
	float						mElapsedTime;
	std::map <hstring,unsigned int>	mFieldCounts;
	float						mFrameCount;

public:
	void Reset(void)
	{
		mFieldCounts.clear();
		mFrameCount=0;
	}

	void AddField(char *fieldName,int sizeBytes)
	{
		assert(sizeBytes>=0);
		if(sizeBytes==0)
		{
			return;
		}
		std::map<hstring,unsigned int>::iterator f=mFieldCounts.find(fieldName);
		if(f==mFieldCounts.end())
		{
			mFieldCounts[fieldName]=(unsigned int)sizeBytes;
		}
		else
		{
			mFieldCounts[fieldName]+=(unsigned int)sizeBytes;
		}
	}

	void IncTime(int msec)
	{
		mElapsedTime+=msec;
	}

	void ShowTotals(void)
	{
		float									totalBytes=0;
		std::multimap<unsigned int,hstring>			sort;
		std::map<hstring,unsigned int>::iterator		f;
		for(f=mFieldCounts.begin();f!=mFieldCounts.end();f++)
		{
			sort.insert(std::pair<unsigned int,hstring> ((*f).second,(*f).first));
			totalBytes+=(*f).second;
		}

		std::multimap<unsigned int,hstring>::iterator	j;
		char										msg[1024];
		float										percent;
		sprintf(msg,
				"******** Totals: bytes %d : bytes per sec %d ********\n",
				(unsigned int)totalBytes,
				(unsigned int)((totalBytes/mElapsedTime)*1000));
		Sleep(10);
		OutputDebugString(msg);
		for(j=sort.begin();j!=sort.end();j++)
		{
			percent=(((float)(*j).first)/totalBytes)*100.0f;
			assert(strlen((*j).second.c_str())<1024);
			sprintf(msg,"%36s : %3.4f percent : %d bytes \n",(*j).second.c_str(),percent,(*j).first);
			Sleep(10);
			OutputDebugString(msg);
		}
	}
};

INetProfile &ClReadProf(void)
{
	static CNetProfile theClReadProf;
	return(theClReadProf);
}

INetProfile &ClSendProf(void)
{
	static CNetProfile theClSendProf;
	return(theClSendProf);
}

#endif // _DONETPROFILE_
